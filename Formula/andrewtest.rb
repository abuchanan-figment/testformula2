class Andrewtest < Formula
    desc "Command and Control"
    homepage "https://github.com/werdhaihai/"
    url "https://github.com/abuchanan-figment/testformula2/releases/download/1.33.7/andrewtest-1.33.7.tar.gz"
    sha256 "a06ab8c8c548169e5b299b7e807b110b5b1ace74f9044e7a3db8f54c0653df53"
    version "1.33.7"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        system "/usr/local/bin/docker-compose", "up", "-d", "-f", f
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
