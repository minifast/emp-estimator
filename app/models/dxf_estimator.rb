require 'base64'
require 'pycall'

class DxfEstimator
  attr_reader :content

  class DefaultEntity
    attr_reader :entity

    def initialize(entity:)
      @entity = entity
    end

    def length
      0
    end
  end

  class LineEntity
    attr_reader :entity

    def initialize(entity:)
      @entity = entity
    end

    def length
      Math.sqrt(
        (entity.dxf.start[0] - entity.dxf.end[0]) ** 2 +
        (entity.dxf.start[1] - entity.dxf.end[1]) ** 2
      )
    end
  end

  class ArcEntity
    attr_reader :entity

    def initialize(entity:)
      @entity = entity
    end

    def length
      (
        ((entity.dxf.end_angle - entity.dxf.start_angle) * Math::PI / 180) *
        entity.dxf.radius
      ).abs
    end
  end

  def self.resolve(type)
    {
      'LINE' => LineEntity,
      'ARC' => ArcEntity,
    }.fetch(type, DefaultEntity)
  end

  def initialize(content:)
    @content = content
  end

  def ezdxf
    @ezdxf ||= PyCall.import_module("ezdxf")
  end

  def encoded_content
    @encoded_content ||= Base64.encode64(content)
  end

  def drawing
    @drawing ||= ezdxf.decode_base64(encoded_content)
  end

  def entities
    @entities ||= PyCall::IterableWrapper.new(drawing.modelspace).map { |entity| self.class.resolve(entity.dxftype).new(entity: entity) }
  end

  def length
    entities.sum(&:length)
  end
end
