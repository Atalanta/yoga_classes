require 'yaml'

index = ['HathaBeginners', 'HathaIntermediate', 'AshtangaBeginners', 'AshtangaIntermediate', 'AshtangaAdvanced']
classes = {
  "HathaBeginners" => [
                        "meli",
                        "wilf"
                       ],
  "HathaIntermediate" => [
                           "atty",
                           "bram"
                          ],
  "AsthangaAdvanced" => [
                          "helena",
                          "denis"
                         ],
  "AshtangaIntermediate" => [
                              "stephen",
                              "helena",
                            ],
  "AshtangaBeginners" => [
                            "grabby",
                            "grandpa",
                            "stephen"
                           ]
}

File.open("index.yaml", "w") { |file| file.write(index.to_yaml) }
File.open("classes.yaml", "w") { |file| file.write(classes.to_yaml) }

puts "Yoga index and classes database initialised."
