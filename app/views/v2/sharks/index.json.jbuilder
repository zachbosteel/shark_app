json.array! @sharks.each do |shark|
  json.partial! 'v2/sharks/sharks', shark: shark
end