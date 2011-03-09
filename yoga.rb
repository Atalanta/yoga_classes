require 'rubygems'
require 'sinatra/base'
require 'haml'
require 'yaml'
require 'awesome_print'

class Yoga < Sinatra::Base

  helpers do
    def unsubscribe(student, yoga_class)
      classes = get_classes
      students = classes[yoga_class]
      index = students.index(student)
      classes[yoga_class].delete_at(index)
      File.open("classes.yaml", "w") { |file| file.write(classes.to_yaml) }
    end

    def get_classes
      File.open("classes.yaml") { |file| YAML.load(file) }
    end

    def get_index
      File.open("index.yaml") { |file| YAML.load(file) }
    end

    def promote(student, yoga_class) 
      classes = get_classes
      class_index = get_index
      current_class_index = class_index.index(yoga_class).to_i
      if (current_class_index + 1) == class_index.size
        return ap "There's no class more advanced that #{yoga_class}"
      end
      next_class = class_index[current_class_index + 1]
      classes[next_class] << student 
      File.open("classes.yaml", "w") { |file| file.write(classes.to_yaml) }
    end
   end

  get "/" do
    @classes = get_classes
    haml :classes
  end

  post "/" do
    unsubscribe(params[:student], params[:yoga_class])
    redirect "/"
  end

  post "/promote" do
    promote(params[:student], params[:yoga_class])
    redirect "/"
  end

end
