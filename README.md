<p align="center">
  <img src="https://github.com/macaroni-os/macaroni-site/blob/master/site/static/images/logo.png">
</p>

# sambuca-kernels

Macaroni OS Kernel for Sambuca Stack.

Every branch is for a specific release:

* `phoenix`: Macaroni OS Phoenix release - AMD64

* `wyrm`: Macaroni OS Wyrm release - ARM64/ARM


## Packages list

In order to use the tree you need to create the index tree file:

```
$> anise-build tree genidx --only-upper-level -t packages

```

Retrieve the list of packages:

```
$> anise-build tree pkglist -t packages
```

or in JSON/YAML format

```
$> anise-build tree pkglist -t packages -o json
$> anise-build tree pkglist -t packages -o yaml
```

## Show the rendered build.yaml of a package

```
$> anise-build tree render -t packages/  kernel-7.0/orangepi5-vanilla
👁️  Processing package kernel-7.0/orangepi5-vanilla-7.0.4...

name: ""
category: ""
env:
    - TARGETDIR=/pkgdir
    - KVER=7.0.4
prelude:
    - ls /usr/src/ -l && mkdir -p ${TARGETDIR}/boot/dtb-${KVER}/rockchip
    - cp orangepi5-config ${TARGETDIR}/boot/config-${KVER}
    - bash build.sh "7.0.4"
image: macaronios/mark-31:latest-arm64
package_dir: /pkgdir

```

## Build a package

```
$> PACKAGES="kernel-7.0/orangepi5-vanilla" make build
```


