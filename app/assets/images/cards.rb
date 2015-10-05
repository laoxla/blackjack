([0] + (2..9).to_a + %w(J Q K A)).each do |val|
  %w(D C S H).each do |suit|
    system "curl -o #{val}#{suit}.png http://deckofcardsapi.com/static/img/#{val}#{suit}.png"
  end
end

%w(D C S H).each do |suit|
  val = 0
  system "curl -o #{val}#{suit}.png http://deckofcardsapi.com/static/img/#{val}#{suit}.png"
end
