class FSTRomano
  def initialize(cadeia)
    @cadeia = cadeia.upcase.strip
    @indice = 0
    @max = @cadeia.size
    @saida = ""
  end

  def proximo
    if @indice >= @max
      "" 
    else
      @cadeia[@indice]
    end
  end

  def emitir(valor)
    @saida += valor.to_s 
    puts "Saída emitida: #{valor.to_s.ljust(3)} | Acumulado: #{@saida}"
  end

  def aceitar
    puts "Aceito 😀"
    puts "Número decimal: #{@saida.to_i}"
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
      simbolo_atual = proximo

      case [simbolo_atual, estado]

      # -------- INÍCIO --------
      in ["M", "qInicio"] then estado = "qMilhar_M"
      in ["C", "qInicio"] then estado = "qCentena_C"
      in ["D", "qInicio"] then estado = "qCentena_D"
      in ["X", "qInicio"] then estado = "qDezena_X"
      in ["L", "qInicio"] then estado = "qDezena_L"
      in ["I", "qInicio"] then estado = "qUnidade_I"
      in ["V", "qInicio"] then estado = "qUnidade_V"
      in ["",  "qInicio"] then estado = "qFinal"

      # -------- MILHARES --------
      in ["M", "qMilhar_M"]  then estado = "qMilhar_2M"
      in ["C", "qMilhar_M"]  then emitir("1");   estado = "qCentena_C"
      in ["D", "qMilhar_M"]  then emitir("1");   estado = "qCentena_D"
      in ["X", "qMilhar_M"]  then emitir("10");  estado = "qDezena_X"
      in ["L", "qMilhar_M"]  then emitir("10");  estado = "qDezena_L"
      in ["I", "qMilhar_M"]  then emitir("100"); estado = "qUnidade_I"
      in ["V", "qMilhar_M"]  then emitir("100"); estado = "qUnidade_V"
      in ["",  "qMilhar_M"]  then emitir("1");   estado = "qCentena"

      in ["M", "qMilhar_2M"] then estado = "qMilhar_3M"
      in ["C", "qMilhar_2M"] then emitir("2");   estado = "qCentena_C"
      in ["D", "qMilhar_2M"] then emitir("2");   estado = "qCentena_D"
      in ["X", "qMilhar_2M"] then emitir("20");  estado = "qDezena_X"
      in ["L", "qMilhar_2M"] then emitir("20");  estado = "qDezena_L"
      in ["I", "qMilhar_2M"] then emitir("200"); estado = "qUnidade_I"
      in ["V", "qMilhar_2M"] then emitir("200"); estado = "qUnidade_V"
      in ["",  "qMilhar_2M"] then emitir("2");   estado = "qCentena"

      in ["C", "qMilhar_3M"] then emitir("3");   estado = "qCentena_C"
      in ["D", "qMilhar_3M"] then emitir("3");   estado = "qCentena_D"
      in ["X", "qMilhar_3M"] then emitir("30");  estado = "qDezena_X"
      in ["L", "qMilhar_3M"] then emitir("30");  estado = "qDezena_L"
      in ["I", "qMilhar_3M"] then emitir("300"); estado = "qUnidade_I"
      in ["V", "qMilhar_3M"] then emitir("300"); estado = "qUnidade_V"
      in ["",  "qMilhar_3M"] then emitir("3");   estado = "qCentena"

      # -------- CENTENAS --------
      in ["C", "qCentena_C"] then estado = "qCentena_2C"
      in ["M", "qCentena_C"] then estado = "qCentena_CM"
      in ["D", "qCentena_C"] then estado = "qCentena_CD"
      in ["X", "qCentena_C"] then emitir("1");  estado = "qDezena_X"
      in ["L", "qCentena_C"] then emitir("1");  estado = "qDezena_L"
      in ["I", "qCentena_C"] then emitir("10"); estado = "qUnidade_I"
      in ["V", "qCentena_C"] then emitir("10"); estado = "qUnidade_V"
      in ["",  "qCentena_C"] then emitir("1");  estado = "qDezena"

      in ["C", "qCentena_2C"] then estado = "qCentena_3C"
      in ["X", "qCentena_2C"] then emitir("2");  estado = "qDezena_X"
      in ["L", "qCentena_2C"] then emitir("2");  estado = "qDezena_L"
      in ["I", "qCentena_2C"] then emitir("20"); estado = "qUnidade_I"
      in ["V", "qCentena_2C"] then emitir("20"); estado = "qUnidade_V"
      in ["",  "qCentena_2C"] then emitir("2");  estado = "qDezena"

      in ["X", "qCentena_3C"] then emitir("3");  estado = "qDezena_X"
      in ["L", "qCentena_3C"] then emitir("3");  estado = "qDezena_L"
      in ["I", "qCentena_3C"] then emitir("30"); estado = "qUnidade_I"
      in ["V", "qCentena_3C"] then emitir("30"); estado = "qUnidade_V"
      in ["",  "qCentena_3C"] then emitir("3");  estado = "qDezena"

      in ["X", "qCentena_CD"] then emitir("4");  estado = "qDezena_X"
      in ["L", "qCentena_CD"] then emitir("4");  estado = "qDezena_L"
      in ["I", "qCentena_CD"] then emitir("40"); estado = "qUnidade_I"
      in ["V", "qCentena_CD"] then emitir("40"); estado = "qUnidade_V"
      in ["",  "qCentena_CD"] then emitir("4");  estado = "qDezena"

      in ["C", "qCentena_D"] then estado = "qCentena_6D"
      in ["X", "qCentena_D"] then emitir("5");  estado = "qDezena_X"
      in ["L", "qCentena_D"] then emitir("5");  estado = "qDezena_L"
      in ["I", "qCentena_D"] then emitir("50"); estado = "qUnidade_I"
      in ["V", "qCentena_D"] then emitir("50"); estado = "qUnidade_V"
      in ["",  "qCentena_D"] then emitir("5");  estado = "qDezena"

      in ["C", "qCentena_6D"] then estado = "qCentena_7D"
      in ["X", "qCentena_6D"] then emitir("6");  estado = "qDezena_X"
      in ["L", "qCentena_6D"] then emitir("6");  estado = "qDezena_L"
      in ["I", "qCentena_6D"] then emitir("60"); estado = "qUnidade_I"
      in ["V", "qCentena_6D"] then emitir("60"); estado = "qUnidade_V"
      in ["",  "qCentena_6D"] then emitir("6");  estado = "qDezena"

      in ["C", "qCentena_7D"] then estado = "qCentena_8D"
      in ["X", "qCentena_7D"] then emitir("7");  estado = "qDezena_X"
      in ["L", "qCentena_7D"] then emitir("7");  estado = "qDezena_L"
      in ["I", "qCentena_7D"] then emitir("70"); estado = "qUnidade_I"
      in ["V", "qCentena_7D"] then emitir("70"); estado = "qUnidade_V"
      in ["",  "qCentena_7D"] then emitir("7");  estado = "qDezena"

      in ["X", "qCentena_8D"] then emitir("8");  estado = "qDezena_X"
      in ["L", "qCentena_8D"] then emitir("8");  estado = "qDezena_L"
      in ["I", "qCentena_8D"] then emitir("80"); estado = "qUnidade_I"
      in ["V", "qCentena_8D"] then emitir("80"); estado = "qUnidade_V"
      in ["",  "qCentena_8D"] then emitir("8");  estado = "qDezena"

      in ["X", "qCentena_CM"] then emitir("9");  estado = "qDezena_X"
      in ["L", "qCentena_CM"] then emitir("9");  estado = "qDezena_L"
      in ["I", "qCentena_CM"] then emitir("90"); estado = "qUnidade_I"
      in ["V", "qCentena_CM"] then emitir("90"); estado = "qUnidade_V"
      in ["",  "qCentena_CM"] then emitir("9");  estado = "qDezena"

      # -------- DEZENAS --------
      in ["X", "qDezena_X"] then estado = "qDezena_2X"
      in ["L", "qDezena_X"] then estado = "qDezena_XL"
      in ["C", "qDezena_X"] then estado = "qDezena_XC"
      in ["I", "qDezena_X"] then emitir("1"); estado = "qUnidade_I"
      in ["V", "qDezena_X"] then emitir("1"); estado = "qUnidade_V"
      in ["",  "qDezena_X"] then emitir("1"); estado = "qUnidade"

      in ["X", "qDezena_2X"] then estado = "qDezena_3X"
      in ["I", "qDezena_2X"] then emitir("2"); estado = "qUnidade_I"
      in ["V", "qDezena_2X"] then emitir("2"); estado = "qUnidade_V"
      in ["",  "qDezena_2X"] then emitir("2"); estado = "qUnidade"

      in ["I", "qDezena_3X"] then emitir("3"); estado = "qUnidade_I"
      in ["V", "qDezena_3X"] then emitir("3"); estado = "qUnidade_V"
      in ["",  "qDezena_3X"] then emitir("3"); estado = "qUnidade"

      in ["I", "qDezena_XL"] then emitir("4"); estado = "qUnidade_I"
      in ["V", "qDezena_XL"] then emitir("4"); estado = "qUnidade_V"
      in ["",  "qDezena_XL"] then emitir("4"); estado = "qUnidade"

      in ["X", "qDezena_L"] then estado = "qDezena_6L"
      in ["I", "qDezena_L"] then emitir("5"); estado = "qUnidade_I"
      in ["V", "qDezena_L"] then emitir("5"); estado = "qUnidade_V"
      in ["",  "qDezena_L"] then emitir("5"); estado = "qUnidade"

      in ["X", "qDezena_6L"] then estado = "qDezena_7L"
      in ["I", "qDezena_6L"] then emitir("6"); estado = "qUnidade_I"
      in ["V", "qDezena_6L"] then emitir("6"); estado = "qUnidade_V"
      in ["",  "qDezena_6L"] then emitir("6"); estado = "qUnidade"

      in ["X", "qDezena_7L"] then estado = "qDezena_8L"
      in ["I", "qDezena_7L"] then emitir("7"); estado = "qUnidade_I"
      in ["V", "qDezena_7L"] then emitir("7"); estado = "qUnidade_V"
      in ["",  "qDezena_7L"] then emitir("7"); estado = "qUnidade"

      in ["I", "qDezena_8L"] then emitir("8"); estado = "qUnidade_I"
      in ["V", "qDezena_8L"] then emitir("8"); estado = "qUnidade_V"
      in ["",  "qDezena_8L"] then emitir("8"); estado = "qUnidade"

      in ["I", "qDezena_XC"] then emitir("9"); estado = "qUnidade_I"
      in ["V", "qDezena_XC"] then emitir("9"); estado = "qUnidade_V"
      in ["",  "qDezena_XC"] then emitir("9"); estado = "qUnidade"

      # -------- UNIDADES --------
      in ["I", "qUnidade_I"] then estado = "qUnidade_2I"
      in ["V", "qUnidade_I"] then emitir("4"); estado = "qFinal"
      in ["X", "qUnidade_I"] then emitir("9"); estado = "qFinal"
      in ["",  "qUnidade_I"] then emitir("1"); estado = "qFinal"

      in ["I", "qUnidade_2I"] then estado = "qUnidade_3I"
      in ["",  "qUnidade_2I"] then emitir("2"); estado = "qFinal"

      in ["",  "qUnidade_3I"] then emitir("3"); estado = "qFinal"

      in ["I", "qUnidade_V"]  then estado = "qUnidade_6V"
      in ["",  "qUnidade_V"]  then emitir("5"); estado = "qFinal"

      in ["I", "qUnidade_6V"] then estado = "qUnidade_7V"
      in ["",  "qUnidade_6V"] then emitir("6"); estado = "qFinal"

      in ["I", "qUnidade_7V"] then estado = "qUnidade_8V"
      in ["",  "qUnidade_7V"] then emitir("7"); estado = "qFinal"

      in ["",  "qUnidade_8V"] then emitir("8"); estado = "qFinal"

      # -------- CASCATA DE ZEROS --------
      in ["", "qCentena"]
        emitir("0")
        estado = "qDezena"
        
      in ["", "qDezena"]
        emitir("0")
        estado = "qUnidade"
        
      in ["", "qUnidade"]
        emitir("0")
        estado = "qFinal"

      else
        erro(estado)
        break
      end

      @indice += 1 if simbolo_atual != ""
      
      if estado == "qFinal"
        aceitar
        break
      end
    end
  end
end

puts "Digite um número romano (de I a MMMCMXCIX):"
entrada = gets.chomp

fst = FSTRomano.new(entrada)
fst.iniciar
