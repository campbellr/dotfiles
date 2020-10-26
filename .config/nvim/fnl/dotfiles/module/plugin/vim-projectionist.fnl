(module dotfiles.module.plugin.vim-projectionist
  {require {nvim aniseed.nvim}})

(set nvim.g.projectionist_heuristics
  {:package.json {"src/*.js"       {:alternate "src/{}.test.js" :type "source"}
                  "src/*.test.js"  {:alternate "src/{}.js" :type "test"}
                  "src/*.tsx"      {:alternate "src/{}.test.tsx" :type "source"}
                  "src/*.test.tsx" {:alternate "src/{}.tsx" :type "test"}}

   :pom.xml      {"src/main/java/*.java"     {:alternate "src/test/java/{}Test.java" :type "source"}
                  "src/test/java/*Test.java" {:alternate "src/main/java/{}.java" :type "test"}}})
