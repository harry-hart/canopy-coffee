{
  description = "My web project with Dart Sass";

  inputs = {
    # Pin your Nixpkgs version for reproducibility
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Define the system architecture(s) you support
      system = "x86_64-linux";
      # Function to define outputs for each system
        pkgs = nixpkgs.legacyPackages.${system};
    in
      {
        # Define the development shell
        devShells.${system}.default = pkgs.mkShell {
          # List your required packages
          packages = with pkgs; [
            # Dart Sass is available directly in Nixpkgs
            dart-sass
            # Add any other tools you need, e.g., Node.js for a frontend project
            # nodejs
            # Git, your preferred editor, etc.
          ];

          # Optional: Run commands when entering the shell (e.g., to display info)
          shellHook = ''
            echo "Dart Sass version: $(sass --version)"
            echo "Entering reproducible web development shell!"
          '';
        };
      };
}
