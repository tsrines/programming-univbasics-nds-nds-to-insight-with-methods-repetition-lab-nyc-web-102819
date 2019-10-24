$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  directors = []
  i = 0 
  while i < source.size do
    directors << source[i][:name]
    i += 1  
  end
  directors
end

def total_gross(source)
  dir_total = directors_totals(source)
  dir_names = list_of_directors(source)
  index = 0
  total = 0 
  while index < dir_names.length do
    dir_name = dir_names[index]
    total += dir_total[dir_name]
    index += 1 
  end
total
end
