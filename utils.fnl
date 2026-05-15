(local {: view} (require :fennel))

(fn split-str [str sep]
  (let [result []]
    (each [part (string.gmatch str (.. "[^" sep "]+"))]
      (table.insert result part))
    result))

{: split-str}
