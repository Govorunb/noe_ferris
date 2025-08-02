# DR face sprites
# UTMT exports them as e.g. spr_rory_nyte_[0..50].png
# but dialogue parser uses 0..9, A..Z, a..z (e.g. "\\Ex")

# mapping the letters back to sprite indices:
# 0..9 - uses the number
# A..Z - 10..35 (char 65..90  | -55)
# a..z - 36..61 (char 97..122 | -61)

gci -Filter "spr_*.png" | % {
  if ($_.Name -notmatch "spr_(.*)_(\d+)\.png") {
    Write-Host "Skipping $($_.Name), doesn't match 'spr_[...]_[digits].png'"
    return
  }
  $digit = [int]($Matches[2])
  if ($digit -lt 10) {
    Write-Host "Leaving $digit.png as is" 
    return
  }
  $digit -= 10
  $base = [int][char]'A'
  if ($digit -gt 25) {
    $digit -= 26
    # ASCII lowercase = uppercase | 0x20 (or + 0x20)
    $base += 0x20 # lowercase
  }
  $chr = $Matches[2] + "_" + [char]($base + $digit)
  Write-Host "Renaming $($Matches[2]).png to $chr.png"
  rename-item $_ "spr_$($Matches[1])_$chr.png"
}
