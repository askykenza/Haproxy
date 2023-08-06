#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYN��Q  J߀@����=ڪ���@Ò4M4l�����ښz��i��Pd�MOH$�OSF��� h�#  ���&L�20�&�db``�S�<*z2��)������i�a�=Fh �6r�t.� ����WFT�O� e�Q��{�r�3A�`�Ahe��`��<���Fc�T�'�n�V@�J�����I�������a�Qkx<@M"c1��b]�>˧���!�F\���c�5GQ��uXA	sL4*jN�z��~Z[�S�{2�(��R �O��kG�w}k�Ke��� �^�3VFP&��`�� &>��f"!�����0-3b4�pϪ�X�$��R�c��n���2d_��$��!��Qa�u�5!�q�>���pJ�U��?,[2��ף	�"�L��P|ns<u�;�#<�v
O}�T/�j#QҊb��
h@!<I%U�V��) 3k"�3!@��%?TK�����ō���1��IE_,�`����"�iV���`Dݰm��{3D*�%Ê�����=������]��BA;G�D