for module in `busybox --list-modules`
do
  mkdir -p `dirname "$module"`
  ln -sf /bin/busybox "$module"
done