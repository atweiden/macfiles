#!/bin/bash

_keyids=()

# alpine (https://www.alpinelinux.org/downloads/)
_keyids+=('0482D84022F52DF1C4E7CD43293ACD0907D9495A')

# archlinux (https://www.archlinux.org/people/trusted-users/)
_keyids+=('4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'
          '487EACC08557AD082088DABA1EB2638FF56C0C53'
          'A314827C4E4250A204CE6E13284FC34C8E4B1A25'
          '86CFFCA918CF3AF47147588051E8B148A9999C34'
          'F3691687D867B81B51CE07D9BBE43771487328A9'
          'BD84DE71F493DF6814B0167254EDC91609BC9183'
          'EC3CBE7F607D11E663149E811D1F0DC78F173680')

# archlinuxarm (https://archlinuxarm.org/about/downloads)
_keyids+=('68B3537F39A313B3E574D06777193F152BDBE6A6')

# tails (https://tails.boum.org/doc/about/openpgp_keys/index.en.html#index2h1)
_keyids+=('A490D0F4D311A4153E2BB7CADBB802B258ACD84F'
          '1F56EDD30741048035DAC1C5EC57B56EF0C43132'
          'F3CD9B7B4BDF9995DA22088E457080B5A072CBE3'
          '256DEB9077880CD681678528C436090F4BB47C6F'
          '0B088E31D4F8E59A3D399137D2EDA621B572DD73'
          'D113CB6D5131D34BA5F0FE9E70F4F03116525F43')

# voidlinux (https://www.voidlinux.eu/download/)
_keyids+=('CF24B9C038097D8A44958E2C8DEBDA68B48282A4')

# whonix (https://www.whonix.org/wiki/Whonix_Signing_Key)
_keyids+=('916B8D99C38EAF5E8ADC7A2A8D66066A2EEACCDA')

# bisq (https://github.com/bisq-network/exchange/releases)
_keyids+=('1DC3C8C4316A698AC494039CF5B84436F379A1C6')

# cryfs (https://github.com/cryfs/cryfs/releases)
_keyids+=('C3111FE656732704EF6DF059017DC932549E65B2')

# electrum (https://electrum.org/download.html)
_keyids+=('6694D8DE7BE8EE5631BED9502BD5824B7F9470E6')

# enigmail (https://www.enigmail.net/home/members.php)
_keyids+=('4F9F89F5505AC1D1A260631CDB1187B9DD5F693B'
          '10B2E4A0E718BB1B2791DAC4F040E41B9369CDF3')

# gnupg (https://www.gnupg.org/signature_key.html)
_keyids+=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
          'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9'
          '031EC2536E580D8EA286A9F22071B08A33BD3F06'
          '46CC730865BB5C78EBABADCF04376F3EE0856959'
          '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28')

# i2p (https://geti2p.net/en/get-involved/develop/release-signing-key)
_keyids+=('2D3D2D03910C6504C1210C65EE60C0C8EE7256A8'
          '2253E2A1EEB40E2A3D22EB1D0EC51FCDA94FB53E')

# nginx (https://nginx.org/en/pgp_keys.html)
_keyids+=('573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62')

# perl6
# (https://github.com/MoarVM/MoarVM/issues/186)
_keyids+=('E2AEB3D93FB3940B844C9E08A68DF012C3881D62')
# (https://rakudo.perl6.org/downloads/rakudo/)
_keyids+=('E1A575CCC2D58C7AA5609FE14710D9D434A4A3C6')

# ricochet (https://ricochet.im)
_keyids+=('9032CAE4CBFA933A5A2145D5FF97C53F183C045D')

# rust (https://www.rust-lang.org/en-US/other-installers.html)
_keyids+=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE')

# sylpheed (https://sylpheed.sraoss.jp/en/download.html)
_keyids+=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26')

# tor (https://www.torproject.org/docs/verifying-signatures.html.en)
_keyids+=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

# veracrypt (https://www.idrix.fr/Root/content/category/7/32/46/)
_keyids+=('993B7D7E8E413809828F0F29EB559C7C54DDD393')

# download pgp keys with curl because gpg --recv-keys "${_keyids[@]}"
# always hangs/fails on less than stellar network connections
# credit: https://dev-notes.eu/2017/09/verify-and-setup-litecoin-core/
_keyurl='https://sks-keyservers.net/pks/lookup?op=get&search=0x'
_keydir="$HOME/.gnupg/public-keys"
mkdir -p "$_keydir"
for _keyid in "${_keyids[@]}"; do
  _url="${_keyurl}${_keyid}"
  _key="${_keydir}/${_keyid}.asc"
  curl --retry 7 --silent "$_url" | sed -n '1,/<pre>/d;/<\/pre>/q;p' > "$_key" &
done
wait
for _keyid in "${_keyids[@]}"; do
  _key="${_keydir}/${_keyid}.asc"
  gpg --import "$_key"
done

# vim: set filetype=sh foldmethod=marker foldlevel=0:
