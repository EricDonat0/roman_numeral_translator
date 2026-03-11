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
    estado = "q0"

    if @cadeia.empty?
      puts "Erro ❌"
      puts "Cadeia vazia não é um número romano válido"
      return
    end

    puts "Máquina iniciou no estado: #{estado}"
    puts "Entrada: #{@cadeia}"

    loop do
      case [proximo, estado]

      
      # ESTADO INICIAL / CASA DOS MILHARES
      
      in ["M", "q0"]
        emitir(1000)
        estado = "qM1"

      in ["C", "q0"]
        estado = "qH_C1"

      in ["D", "q0"]
        emitir(500)
        estado = "qH_D"

      in ["X", "q0"]
        estado = "qT_X1"

      in ["L", "q0"]
        emitir(50)
        estado = "qT_L"

      in ["I", "q0"]
        estado = "qU_I1"

      in ["V", "q0"]
        emitir(5)
        estado = "qU_V"

      in ["", "q0"]
        erro(estado)
        break

      in ["M", "qM1"]
        emitir(1000)
        estado = "qM2"

      in ["C", "qM1"]
        estado = "qH_C1"

      in ["D", "qM1"]
        emitir(500)
        estado = "qH_D"

      in ["X", "qM1"]
        estado = "qT_X1"

      in ["L", "qM1"]
        emitir(50)
        estado = "qT_L"

      in ["I", "qM1"]
        estado = "qU_I1"

      in ["V", "qM1"]
        emitir(5)
        estado = "qU_V"

      in ["", "qM1"]
        aceitar
        break

      in ["M", "qM2"]
        emitir(1000)
        estado = "qM3"

      in ["C", "qM2"]
        estado = "qH_C1"

      in ["D", "qM2"]
        emitir(500)
        estado = "qH_D"

      in ["X", "qM2"]
        estado = "qT_X1"

      in ["L", "qM2"]
        emitir(50)
        estado = "qT_L"

      in ["I", "qM2"]
        estado = "qU_I1"

      in ["V", "qM2"]
        emitir(5)
        estado = "qU_V"

      in ["", "qM2"]
        aceitar
        break

      in ["C", "qM3"]
        estado = "qH_C1"

      in ["D", "qM3"]
        emitir(500)
        estado = "qH_D"

      in ["X", "qM3"]
        estado = "qT_X1"

      in ["L", "qM3"]
        emitir(50)
        estado = "qT_L"

      in ["I", "qM3"]
        estado = "qU_I1"

      in ["V", "qM3"]
        emitir(5)
        estado = "qU_V"

      in ["", "qM3"]
        aceitar
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