;;; init.el --- Project initialization -*- lexical-binding: t -*-

;; Copyright 2018 The original authors.
;; 
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;; 
;;     http://www.apache.org/licenses/LICENSE-2.0
;; 
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;; 

;;; Code:

(require 'idee-arch)
(require 'idee/java)

(defun dekorate-create-configuration-generator-factory ()
  "A simple java factory archetype."
  (interactive)
  (let* ((current-fqcn (idee/java-fqcn-of (buffer-file-name)))
         (current-pkg (idee/java-package-of (buffer-file-name)))
         (initial (if (and current-fqcn (idee-ends-with current-fqcn "Generator")) (concat current-fqcn "Factory") current-pkg))
         (fqcn (read-string "Config generator factory class name:" initial)))
    (message "Current class:%s package:%s" current-fqcn current-pkg)
    (idee/java-archetype-create-class fqcn "dekorate-configuration-generator-factory")
    (idee/java-register-spi "io.dekorate.ConfigurationGeneratorFactory" fqcn)))

(idee-register-archetype
  (make-idee-archetype
   :name "Dekorate Configuration Generator Factory"
   :description "A factory for io.dekorate.ConfigurationGenerator"
   :func 'dekorate-create-configuration-generator-factory))


(defun dekorate-create-manifest-generator-factory ()
  "A simple java factory archetype."
  (interactive)
  (let* ((current-fqcn (idee/java-fqcn-of (buffer-file-name)))
         (current-pkg (idee/java-package-of (buffer-file-name)))
         (initial (if (and current-fqcn (idee-ends-with current-fqcn "Generator")) (concat current-fqcn "Factory") current-pkg))
         (fqcn (read-string "Manifest generator factory class name:" initial)))
    (message "Current class:%s package:%s" current-fqcn current-pkg)
    (idee/java-archetype-create-class fqcn "dekorate-manifest-generator-factory")
    (idee/java-register-spi "io.dekorate.ManifestGeneratorFactory" fqcn)))

(idee-register-archetype
  (make-idee-archetype
   :name "Dekorate Manifest Generator Factory"
   :description "A factory for io.dekorate.ManifestGenerator"
   :func 'dekorate-create-manifest-generator-factory))

