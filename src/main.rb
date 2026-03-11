class ADFRomano
  def initialize(cadeia)
    @cadeia = cadeia.upcase.strip
    @indice = 0
    @max = @cadeia.size
    @saida = 0
  end

  def proximo
    if @indice == @max
      ""
    else
      @cadeia[@indice]
    end
  end

  def emitir(valor)
    @saida += valor
    puts "Saída emitida: #{valor} | acumulado: #{@saida}"
  end

  def aceitar
    puts "Aceito 😀"
    puts "Número decimal: #{@saida}"
  end

  def erro(estado)
    puts "Erro ❌"
    puts "Estado: #{estado}"
    puts "Símbolo lido: '#{proximo}'"
  end

  def iniciar
    estado = "qInicio"

    puts "Máquina iniciou no estado: #{estado}"
    puts "Entrada: #{@cadeia}"

    loop do
      case [proximo, estado]

      # -------- INICIO --------

      in ["M", "qInicio"]
        emitir(1000)
        estado = "qMilhar_1M"

      in ["C", "qInicio"]
        estado = "qCentena_1C"

      in ["D", "qInicio"]
        emitir(500)
        estado = "qCentena_D"

      in ["X", "qInicio"]
        estado = "qDezena_1X"

      in ["L", "qInicio"]
        emitir(50)
        estado = "qDezena_L"

      in ["I", "qInicio"]
        estado = "qUnidade_1I"

      in ["V", "qInicio"]
        emitir(5)
        estado = "qUnidade_V"

      in ["", "qInicio"]
        erro(estado)
        break

      # -------- MILHARES --------

      in ["M", "qMilhar_1M"]
        emitir(1000)
        estado = "qMilhar_2M"

      in ["C", "qMilhar_1M"]
        estado = "qCentena_1C"

      in ["D", "qMilhar_1M"]
        emitir(500)
        estado = "qCentena_D"

      in ["X", "qMilhar_1M"]
        estado = "qDezena_1X"

      in ["L", "qMilhar_1M"]
        emitir(50)
        estado = "qDezena_L"

      in ["I", "qMilhar_1M"]
        estado = "qUnidade_1I"

      in ["V", "qMilhar_1M"]
        emitir(5)
        estado = "qUnidade_V"

      in ["", "qMilhar_1M"]
        aceitar
        break

      in ["M", "qMilhar_2M"]
        emitir(1000)
        estado = "qMilhar_3M"

      in ["C", "qMilhar_2M"]
        estado = "qCentena_1C"

      in ["D", "qMilhar_2M"]
        emitir(500)
        estado = "qCentena_D"

      in ["X", "qMilhar_2M"]
        estado = "qDezena_1X"

      in ["L", "qMilhar_2M"]
        emitir(50)
        estado = "qDezena_L"

      in ["I", "qMilhar_2M"]
        estado = "qUnidade_1I"

      in ["V", "qMilhar_2M"]
        emitir(5)
        estado = "qUnidade_V"

      in ["", "qMilhar_2M"]
        aceitar
        break

      in ["C", "qMilhar_3M"]
        estado = "qCentena_1C"

      in ["D", "qMilhar_3M"]
        emitir(500)
        estado = "qCentena_D"

      in ["X", "qMilhar_3M"]
        estado = "qDezena_1X"

      in ["L", "qMilhar_3M"]
        emitir(50)
        estado = "qDezena_L"

      in ["I", "qMilhar_3M"]
        estado = "qUnidade_1I"

      in ["V", "qMilhar_3M"]
        emitir(5)
        estado = "qUnidade_V"

      in ["", "qMilhar_3M"]
        aceitar
        break

      else
        erro(estado)
        break
      end

      @indice += 1
      puts "Estado: #{estado}"
    end
  end
end

puts "Digite um número romano:"
entrada = gets.chomp

adf = ADFRomano.new(entrada)
adf.iniciar