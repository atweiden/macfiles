#!/usr/bin/env bash

_keyids=()


# -----------------------------------------------------------------------------
# for distros
# -----------------------------------------------------------------------------

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

# freebsd (https://www.freebsd.org/releases/11.1R/signatures.html)
_keyids+=('8D12403C2E6CAB086CF64DA3031458A5478FE293')

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


# -----------------------------------------------------------------------------
# for kernels
# -----------------------------------------------------------------------------

# linux (https://www.kernel.org/signature.html)
_keyids+=('ABAF11C65A2970B130ABE3C479BE3E4300411886'
          '647F28654894E3BD457199BE38DBBDC86092693E')

# linux-hardened
# (https://github.com/anthraxx/linux-hardened/releases)
_keyids+=('E240B57E2C4630BA768E2F26FC1B547C8D8172C8')
# (https://github.com/copperhead/linux-hardened/releases)
_keyids+=('65EEFE022108E2B708CBFCF7F9E712E59AF5F22A')


# -----------------------------------------------------------------------------
# for software
# -----------------------------------------------------------------------------

# bash (https://www.gnu.org/software/bash/)
_keyids+=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB')

# bash-completion (https://github.com/scop/bash-completion/releases)
_keyids+=('A558062B6D5DA1347CD468D52B0AE2C1B09B07CB')

# bisq (https://github.com/bisq-network/exchange/releases)
_keyids+=('1DC3C8C4316A698AC494039CF5B84436F379A1C6')

# bitcoin (https://bitcoin.org/en/full-node#other-linux-distributions)
_keyids+=('01EA5486DE18A882D4C2684590C8019E36C2E964')

# boost (https://www.boost.org/users/download/)
_keyids+=('8756C4F765C9AC3CB6B85D62379CE192D401AB61')

# cryfs (https://github.com/cryfs/cryfs/releases)
_keyids+=('C3111FE656732704EF6DF059017DC932549E65B2')

# cryptsetup (https://gitlab.com/cryptsetup/cryptsetup/wikis/home)
_keyids+=('2A2918243FDE46648D0686F9D9B0577BD93E98FC')

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

# go
# (https://github.com/golang/go/issues/14739)
_keyids+=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')
# (https://www.google.com/linuxrepositories/)
_keyids+=('4CCA1EAF950CEE4AB83976DCA040830F7FAC5991')

# grub (https://www.gnu.org/software/grub/grub-download.html)
_keyids+=('E53D497F3FA42AD8C9B4D1E835A93B74E82E4209')

# i2p (https://geti2p.net/en/get-involved/develop/release-signing-key)
_keyids+=('2D3D2D03910C6504C1210C65EE60C0C8EE7256A8'
          '2253E2A1EEB40E2A3D22EB1D0EC51FCDA94FB53E')

# libressl (https://www.libressl.org/signing.html)
_keyids+=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5')

# lnd (https://github.com/lightningnetwork/lnd/releases)
_keyids+=('65317176B6857F98834EDBE8964EA263DD637C21')

# master password (https://gitlab.com/MasterPassword/MasterPassword)
_keyids+=('5C2D1D61853F20F2FCDDCCB70EF21226F43EA6BC')

# nginx (https://nginx.org/en/pgp_keys.html)
_keyids+=('573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62')

# openssh (https://www.openssh.com/portable.html)
_keyids+=('5D7AE3047AB6D4C340EBD3D4A819A2D8691EF8DA'
          '59C2118ED206D927E667EBE3D3E5F56B6D920D30')

# openssl (https://www.openssl.org/community/omc.html)
_keyids+=('8657ABB260F056B1E5190839D9C4D26D0E604491'
          '5B2545DAB21995F4088CEFAA36CEE4DEB00CFE33'
          'C1F33DD8CE1D4CC613AF14DA9195C48241FBF7DD'
          '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C'
          'E5E52560DD91C556DDBDA5D02064C53641C25E5D'
          'D099684DC7C21E02E14A8AFEF23479455C51B27C')

# perl6
# (https://github.com/MoarVM/MoarVM/issues/186)
_keyids+=('E2AEB3D93FB3940B844C9E08A68DF012C3881D62')
# (https://rakudo.perl6.org/downloads/rakudo/)
_keyids+=('E1A575CCC2D58C7AA5609FE14710D9D434A4A3C6')

# python (https://www.python.org/downloads/source/)
_keyids+=('0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D')

# ricochet (https://ricochet.im)
_keyids+=('9032CAE4CBFA933A5A2145D5FF97C53F183C045D')

# rsync (https://rsync.samba.org/download.html)
_keyids+=('0048C8B026D4C96F0E589C2F6C859FB14B96A8C5')

# rust (https://www.rust-lang.org/en-US/other-installers.html)
_keyids+=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE')

# sylpheed (https://sylpheed.sraoss.jp/en/download.html)
_keyids+=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26')

# systemd (https://github.com/systemd/systemd/releases)
_keyids+=('63CDA1E5D3FC22B998D20DD6327F26951A015CC4'
          '5C251B5FC54EB2F80F407AAAC54CA336CFEB557E')

# tor (https://www.torproject.org/docs/verifying-signatures.html.en)
_keyids+=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

# veracrypt (https://www.idrix.fr/Root/content/category/7/32/46/)
_keyids+=('993B7D7E8E413809828F0F29EB559C7C54DDD393')


# -----------------------------------------------------------------------------
# import
# -----------------------------------------------------------------------------

gpg --recv-keys "${_keyids[@]}"

# vim: set filetype=sh foldmethod=marker foldlevel=0:
