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
