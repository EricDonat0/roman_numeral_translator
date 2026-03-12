class RomanTransducer
  def initialize(cadeia)
    @cadeia = cadeia.to_s.strip.upcase
    @indice = 0
    @max = @cadeia.size
    @total = 0
    @consumiu = false
  end

  def proximo
    if @indice == @max
      ""
    else
      @cadeia[@indice]
    end
  end

  def emitir(valor)
    @total += valor
  end

  def erro!(estado, simbolo)
    raise "Entrada inválida. Estado=#{estado}, símbolo='#{simbolo}'"
  end

  def iniciar
    estado = "q0"

    puts "Máquina iniciou no estado: #{estado}"

    loop do
      simbolo = proximo

      case [simbolo, estado]

      # ESTADO FINAL

      in ["", "qF"]
        puts "Aceito 😀"
        puts "Valor decimal: #{@total}"
        return @total


      # INÍCIO / MILHARES
      # milhares: "", M, MM, MMM

      in ["M", "q0"]
        @consumiu = true
        estado = "qM1"

      in ["M", "qM1"]
        estado = "qM2"

      in ["M", "qM2"]
        estado = "qM3"

      # saídas dos estados de milhares para centenas/dezenas/unidades/fim
      in ["C", "q0"]
        @consumiu = true
        estado = "qHC"

      in ["D", "q0"]
        @consumiu = true
        estado = "qHD"

      in ["X", "q0"]
        @consumiu = true
        estado = "qTX"

      in ["L", "q0"]
        @consumiu = true
        estado = "qTL"

      in ["I", "q0"]
        @consumiu = true
        estado = "qOI"

      in ["V", "q0"]
        @consumiu = true
        estado = "qOV"

      in ["", "q0"]
        erro!(estado, simbolo)

      in ["C", "qM1"]
        emitir(1000)
        estado = "qHC"

      in ["D", "qM1"]
        emitir(1000)
        estado = "qHD"

      in ["X", "qM1"]
        emitir(1000)
        estado = "qTX"

      in ["L", "qM1"]
        emitir(1000)
        estado = "qTL"

      in ["I", "qM1"]
        emitir(1000)
        estado = "qOI"

      in ["V", "qM1"]
        emitir(1000)
        estado = "qOV"

      in ["", "qM1"]
        emitir(1000)
        estado = "qF"

      in ["C", "qM2"]
        emitir(2000)
        estado = "qHC"

      in ["D", "qM2"]
        emitir(2000)
        estado = "qHD"

      in ["X", "qM2"]
        emitir(2000)
        estado = "qTX"

      in ["L", "qM2"]
        emitir(2000)
        estado = "qTL"

      in ["I", "qM2"]
        emitir(2000)
        estado = "qOI"

      in ["V", "qM2"]
        emitir(2000)
        estado = "qOV"

      in ["", "qM2"]
        emitir(2000)
        estado = "qF"

      in ["C", "qM3"]
        emitir(3000)
        estado = "qHC"

      in ["D", "qM3"]
        emitir(3000)
        estado = "qHD"

      in ["X", "qM3"]
        emitir(3000)
        estado = "qTX"

      in ["L", "qM3"]
        emitir(3000)
        estado = "qTL"

      in ["I", "qM3"]
        emitir(3000)
        estado = "qOI"

      in ["V", "qM3"]
        emitir(3000)
        estado = "qOV"

      in ["", "qM3"]
        emitir(3000)
        estado = "qF"

      # CENTENAS
      # "", C, CC, CCC, CD, D, DC, DCC, DCCC, CM

      in ["C", "qHC"]
        estado = "qHCC"

      in ["D", "qHC"]
        emitir(400)
        estado = "qF"

      in ["M", "qHC"]
        emitir(900)
        estado = "qF"

      in ["X", "qHC"]
        emitir(100)
        estado = "qTX"

      in ["L", "qHC"]
        emitir(100)
        estado = "qTL"

      in ["I", "qHC"]
        emitir(100)
        estado = "qOI"

      in ["V", "qHC"]
        emitir(100)
        estado = "qOV"

      in ["", "qHC"]
        emitir(100)
        estado = "qF"

      in ["C", "qHCC"]
        estado = "qHCCC"

      in ["X", "qHCC"]
        emitir(200)
        estado = "qTX"

      in ["L", "qHCC"]
        emitir(200)
        estado = "qTL"

      in ["I", "qHCC"]
        emitir(200)
        estado = "qOI"

      in ["V", "qHCC"]
        emitir(200)
        estado = "qOV"

      in ["", "qHCC"]
        emitir(200)
        estado = "qF"

      in ["X", "qHCCC"]
        emitir(300)
        estado = "qTX"

      in ["L", "qHCCC"]
        emitir(300)
        estado = "qTL"

      in ["I", "qHCCC"]
        emitir(300)
        estado = "qOI"

      in ["V", "qHCCC"]
        emitir(300)
        estado = "qOV"

      in ["", "qHCCC"]
        emitir(300)
        estado = "qF"

      in ["C", "qHD"]
        estado = "qHDC"

      in ["X", "qHD"]
        emitir(500)
        estado = "qTX"

      in ["L", "qHD"]
        emitir(500)
        estado = "qTL"

      in ["I", "qHD"]
        emitir(500)
        estado = "qOI"

      in ["V", "qHD"]
        emitir(500)
        estado = "qOV"

      in ["", "qHD"]
        emitir(500)
        estado = "qF"

      in ["C", "qHDC"]
        estado = "qHDCC"

      in ["X", "qHDC"]
        emitir(600)
        estado = "qTX"

      in ["L", "qHDC"]
        emitir(600)
        estado = "qTL"

      in ["I", "qHDC"]
        emitir(600)
        estado = "qOI"

      in ["V", "qHDC"]
        emitir(600)
        estado = "qOV"

      in ["", "qHDC"]
        emitir(600)
        estado = "qF"

      in ["C", "qHDCC"]
        estado = "qHDCCC"

      in ["X", "qHDCC"]
        emitir(700)
        estado = "qTX"

      in ["L", "qHDCC"]
        emitir(700)
        estado = "qTL"

      in ["I", "qHDCC"]
        emitir(700)
        estado = "qOI"

      in ["V", "qHDCC"]
        emitir(700)
        estado = "qOV"

      in ["", "qHDCC"]
        emitir(700)
        estado = "qF"

      in ["X", "qHDCCC"]
        emitir(800)
        estado = "qTX"

      in ["L", "qHDCCC"]
        emitir(800)
        estado = "qTL"

      in ["I", "qHDCCC"]
        emitir(800)
        estado = "qOI"

      in ["V", "qHDCCC"]
        emitir(800)
        estado = "qOV"

      in ["", "qHDCCC"]
        emitir(800)
        estado = "qF"

      # DEZENAS
      # "", X, XX, XXX, XL, L, LX, LXX, LXXX, XC

      in ["X", "qTX"]
        estado = "qTXX"

      in ["L", "qTX"]
        emitir(40)
        estado = "qF"

      in ["C", "qTX"]
        emitir(90)
        estado = "qF"

      in ["I", "qTX"]
        emitir(10)
        estado = "qOI"

      in ["V", "qTX"]
        emitir(10)
        estado = "qOV"

      in ["", "qTX"]
        emitir(10)
        estado = "qF"

      in ["X", "qTXX"]
        estado = "qTXXX"

      in ["I", "qTXX"]
        emitir(20)
        estado = "qOI"

      in ["V", "qTXX"]
        emitir(20)
        estado = "qOV"

      in ["", "qTXX"]
        emitir(20)
        estado = "qF"

      in ["I", "qTXXX"]
        emitir(30)
        estado = "qOI"

      in ["V", "qTXXX"]
        emitir(30)
        estado = "qOV"

      in ["", "qTXXX"]
        emitir(30)
        estado = "qF"

      in ["X", "qTL"]
        estado = "qTLX"

      in ["I", "qTL"]
        emitir(50)
        estado = "qOI"

      in ["V", "qTL"]
        emitir(50)
        estado = "qOV"

      in ["", "qTL"]
        emitir(50)
        estado = "qF"

      in ["X", "qTLX"]
        estado = "qTLXX"

      in ["I", "qTLX"]
        emitir(60)
        estado = "qOI"

      in ["V", "qTLX"]
        emitir(60)
        estado = "qOV"

      in ["", "qTLX"]
        emitir(60)
        estado = "qF"

      in ["X", "qTLXX"]
        estado = "qTLXXX"

      in ["I", "qTLXX"]
        emitir(70)
        estado = "qOI"

      in ["V", "qTLXX"]
        emitir(70)
        estado = "qOV"

      in ["", "qTLXX"]
        emitir(70)
        estado = "qF"

      in ["I", "qTLXXX"]
        emitir(80)
        estado = "qOI"

      in ["V", "qTLXXX"]
        emitir(80)
        estado = "qOV"

      in ["", "qTLXXX"]
        emitir(80)
        estado = "qF"

      # UNIDADES
      # "", I, II, III, IV, V, VI, VII, VIII, IX

      in ["I", "qOI"]
        estado = "qOII"

      in ["V", "qOI"]
        emitir(4)
        estado = "qF"

      in ["X", "qOI"]
        emitir(9)
        estado = "qF"

      in ["", "qOI"]
        emitir(1)
        estado = "qF"

      in ["I", "qOII"]
        estado = "qOIII"

      in ["", "qOII"]
        emitir(2)
        estado = "qF"

      in ["", "qOIII"]
        emitir(3)
        estado = "qF"

      in ["I", "qOV"]
        estado = "qOVI"

      in ["", "qOV"]
        emitir(5)
        estado = "qF"

      in ["I", "qOVI"]
        estado = "qOVII"

      in ["", "qOVI"]
        emitir(6)
        estado = "qF"

      in ["I", "qOVII"]
        estado = "qOVIII"

      in ["", "qOVII"]
        emitir(7)
        estado = "qF"

      in ["", "qOVIII"]
        emitir(8)
        estado = "qF"

      else
        erro!(estado, simbolo)
      end

      @indice += 1 unless simbolo == ""
      puts "Lido: '#{simbolo}' | Estado: #{estado} | Total parcial: #{@total}"
    end
  end
end