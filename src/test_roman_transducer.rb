require_relative "roman_transducer"

validos = {
  "III" => 3,
  "IV" => 4,
  "IX" => 9,
  "XIV" => 14,
  "XXIX" => 29,
  "XLII" => 42,
  "LXXXVIII" => 88,
  "CXCIV" => 194,
  "MCMXC" => 1990,
  "MMXXIV" => 2024,
  "MMMCMXCIX" => 3999
}

invalidos = [
  "",
  "IC",
  "VX",
  "IIII",
  "VV",
  "IL",
  "XM",
  "MCMC",
  "IIV"
]

puts "\n=== TESTES VÁLIDOS ==="
validos.each do |romano, esperado|
  begin
    resultado = RomanTransducer.new(romano).iniciar
    if resultado == esperado
      puts "[OK] #{romano} => #{resultado}"
    else
      puts "[FALHOU] #{romano} => #{resultado}, esperado #{esperado}"
    end
  rescue => e
    puts "[FALHOU] #{romano} gerou erro: #{e.message}"
  end
end

puts "\n=== TESTES INVÁLIDOS ==="
invalidos.each do |romano|
  begin
    resultado = RomanTransducer.new(romano).iniciar
    puts "[FALHOU] #{romano.inspect} foi aceito com #{resultado}"
  rescue
    puts "[OK] #{romano.inspect} rejeitado"
  end
end