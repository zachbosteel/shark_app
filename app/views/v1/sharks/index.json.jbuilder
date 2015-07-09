json.array! @sharks.each do |shark|
  json.partial! 'v1/sharks/sharks', shark: shark
end