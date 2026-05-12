(fn split [str sep]
    (let [result []]
      (each [part (string.gmatch str (.. "[^" sep "]+"))]
        (table.insert result part))
      result))

