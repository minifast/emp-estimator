# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "@kanety/stimulus-dropzone", to: "https://ga.jspm.io/npm:@kanety/stimulus-dropzone@1.0.4/dist/index.module.js"
pin "@kanety/stimulus-static-actions", to: "https://ga.jspm.io/npm:@kanety/stimulus-static-actions@1.0.1/dist/index.modern.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "dxf", to: "https://ga.jspm.io/npm:dxf@5.0.0/lib/index.js"
pin "lodash/cloneDeep", to: "https://ga.jspm.io/npm:lodash@4.17.21/cloneDeep.js"
pin "vecks", to: "https://ga.jspm.io/npm:vecks@3.9.2/lib/index.js"
