{
  pkgs,
  self,
}:

pkgs.runCommand "formatting-check" { } ''
  ${pkgs.lib.getExe self.formatter.${pkgs.system}} --no-cache --fail-on-change ${../.}
  touch $out
''
