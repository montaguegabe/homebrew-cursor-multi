class CursorMulti < Formula
  desc "CLI tool to manage multiple Git repos for Cursor"
  homepage "https://github.com/montaguegabe/cursor-multi"
  url "https://github.com/montaguegabe/cursor-multi-cli/releases/download/v1.1.7/multi.tar.gz"
  sha256 "adb27386e2552c58e12497a73e7f16dc9c815d90f96309613f755c137740f07c"
  license "MIT"

  def install
    # Install all files from the tarball root into libexec
    # This includes the executable and _internal directory with dependencies
    libexec.install Dir["*"]
    
    # Create a wrapper script in bin/ that executes the actual binary in libexec/
    # and ensures the _internal directory is accessible
    (bin/"multi").write_env_script libexec/"multi", 
      PATH: "#{libexec}:$PATH",
      PYTHONPATH: "#{libexec}"
  end

  test do
    # Test if the CLI command runs and shows help or version
    system "#{bin}/multi", "--version"
  end
end