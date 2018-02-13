#!/bin/bash

_gpg_keys=()

# archlinux (https://www.archlinux.org/people/trusted-users/)
_gpg_keys+=('4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'
            '487EACC08557AD082088DABA1EB2638FF56C0C53'
            'EC3CBE7F607D11E663149E811D1F0DC78F173680')

# tails (https://tails.boum.org/doc/about/openpgp_keys/index.en.html#index2h1)
_gpg_keys+=('A490D0F4D311A4153E2BB7CADBB802B258ACD84F'
            '1F56EDD30741048035DAC1C5EC57B56EF0C43132'
            'F3CD9B7B4BDF9995DA22088E457080B5A072CBE3'
            '256DEB9077880CD681678528C436090F4BB47C6F'
            '0B088E31D4F8E59A3D399137D2EDA621B572DD73'
            'D113CB6D5131D34BA5F0FE9E70F4F03116525F43')

# whonix (https://www.whonix.org/wiki/Whonix_Signing_Key)
_gpg_keys+=('916B8D99C38EAF5E8ADC7A2A8D66066A2EEACCDA')

# bisq (https://github.com/bisq-network/exchange/releases)
_gpg_keys+=('1DC3C8C4316A698AC494039CF5B84436F379A1C6')

# cryfs (https://github.com/cryfs/cryfs/releases)
_gpg_keys+=('C3111FE656732704EF6DF059017DC932549E65B2')

# electrum (https://electrum.org/download.html)
_gpg_keys+=('6694D8DE7BE8EE5631BED9502BD5824B7F9470E6')

# enigmail (https://www.enigmail.net/home/members.php)
_gpg_keys+=('4F9F89F5505AC1D1A260631CDB1187B9DD5F693B'
            '10B2E4A0E718BB1B2791DAC4F040E41B9369CDF3')

# gnupg (https://www.gnupg.org/signature_key.html)
_gpg_keys+=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
            'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9'
            '031EC2536E580D8EA286A9F22071B08A33BD3F06'
            '46CC730865BB5C78EBABADCF04376F3EE0856959'
            '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28')

# i2p (https://geti2p.net/en/get-involved/develop/release-signing-key)
_gpg_keys+=('2D3D2D03910C6504C1210C65EE60C0C8EE7256A8'
            '2253E2A1EEB40E2A3D22EB1D0EC51FCDA94FB53E')

# perl6 (https://rakudo.perl6.org/downloads/rakudo/)
_gpg_keys+=('E1A575CCC2D58C7AA5609FE14710D9D434A4A3C6')

# ricochet (https://ricochet.im)
_gpg_keys+=('9032CAE4CBFA933A5A2145D5FF97C53F183C045D')

# sylpheed (https://sylpheed.sraoss.jp/en/download.html)
_gpg_keys+=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26')

# tor (https://www.torproject.org/docs/verifying-signatures.html.en)
_gpg_keys+=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

# veracrypt (https://www.idrix.fr/Root/content/category/7/32/46/)
_gpg_keys+=('993B7D7E8E413809828F0F29EB559C7C54DDD393')

gpg --recv-keys "${_gpg_keys[@]}"

# vim: set filetype=sh foldmethod=marker foldlevel=0:
