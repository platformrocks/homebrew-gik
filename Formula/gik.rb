# typed: false
# frozen_string_literal: true

# GIK (Guided Indexing Kernel) - Local-first knowledge engine for software projects
class Gik < Formula
  desc "Local-first knowledge engine for software projects with RAG, KG, and memory"
  homepage "https://github.com/platformrocks/osr.gik"
  license "MIT"

  # TODO: Update version for each release
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      # macOS ARM64 (Apple Silicon)
      url "https://github.com/platformrocks/osr.gik/releases/download/v0.1.0/gik-macos-aarch64.tar.gz"
      # TODO: Update sha256 after building release artifact
      # Generate with: shasum -a 256 gik-macos-aarch64.tar.gz
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      # macOS x86_64 (Intel)
      url "https://github.com/platformrocks/osr.gik/releases/download/v0.1.0/gik-macos-x86_64.tar.gz"
      # TODO: Update sha256 after building release artifact
      # Generate with: shasum -a 256 gik-macos-x86_64.tar.gz
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Linux x86_64
      url "https://github.com/platformrocks/osr.gik/releases/download/v0.1.0/gik-linux-x86_64.tar.gz"
      # TODO: Update sha256 after building release artifact
      # Generate with: shasum -a 256 gik-linux-x86_64.tar.gz
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    # The tarball extracts to gik-<platform>/ containing bin/, models/, and config.default.yaml
    bin.install "bin/gik"
    
    # Install models to libexec (Homebrew convention for auxiliary files)
    libexec.install "models"
    
    # Install default config to pkgshare (accessible but not in main path)
    pkgshare.install "config.default.yaml"
  end

  def caveats
    <<~EOS
      GIK has been installed with bundled models and a default configuration.

      Models are installed at:
        #{libexec}/models

      Default config is available at:
        #{pkgshare}/config.default.yaml

      To initialize GIK in your project:
        gik init

      For more information:
        gik --help
        https://github.com/platformrocks/osr.gik
    EOS
  end

  test do
    # Test that the binary runs and shows version
    assert_match version.to_s, shell_output("#{bin}/gik --version")
  end
end
