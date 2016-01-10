CFLAGS += "-fPIC"

DEPENDS += " wayland"

SRCREV = "35e4a8353b26412ca3bc6b258ce438a80a56d434"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://egl.pc \
	    file://glesv2.pc \
 	    file://bcm_host.pc \
	    file://0001-wayland-support.patch \
	    file://0002-fix-build.patch \
            file://buildme.patch \
"

EXTRA_OECMAKE += "-DBUILD_WAYLAND=1"

FILES_${PN} += "${libdir}/pkgconfig \
 	        ${libdir}/pkgconfig/glesv2.pc \
 		${libdir}/pkgconfig/egl.pc \
 		${libdir}/pkgconfig/bcm_host.pc \
 		${libdir}/libGLESv2.so.2.0.0 \
 		${libdir}/libEGL.so.1.0.0 \
 		${libdir}/libGLESv2.so.2 \
 		${libdir}/libEGL.so.1 \
"

FILES_${PN}-dev += "${libdir}/libGLESv2.so \
 		    ${libdir}/libEGL.so \
"
FILES_${PN}-dbg += "${libdir}/.debug"

PACKAGECONFIG += " wayland"

do_install_append() {

  install -d ${D}${libdir}/pkgconfig
  install -m 0644 ${WORKDIR}/glesv2.pc ${D}${libdir}/pkgconfig/
  install -m 0644 ${WORKDIR}/egl.pc ${D}${libdir}/pkgconfig/
  install -m 0644 ${WORKDIR}/bcm_host.pc ${D}${libdir}/pkgconfig/

}
