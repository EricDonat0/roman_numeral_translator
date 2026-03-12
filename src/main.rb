require_relative "roman_transducer"

puts "Digite um número romano:"
entrada = gets.chomp

begin
  maquina = RomanTransducer.new(entrada)
  resultado = maquina.iniciar
  puts "#{entrada.upcase} = #{resultado}"
rescue => e
  puts "Erro: #{e.message}"
end