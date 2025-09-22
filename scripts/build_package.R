pkg_info <- read.dcf("DESCRIPTION", fields = c("Package", "Version"))
pkg_name <- pkg_info[[1]]
pkg_version <- pkg_info[[2]]

# Allow overriding the output directory via the first CLI argument
args <- commandArgs(trailingOnly = TRUE)
dest_dir <- if (length(args) >= 1) args[[1]] else "dist"
dir.create(dest_dir, showWarnings = FALSE, recursive = TRUE)

# Install the package to a temporary library so vignettes can load it
local_lib <- file.path(tempdir(), "ComplementDNASeq-build-lib")
dir.create(local_lib, showWarnings = FALSE, recursive = TRUE)
install_status <- system2("R", c("CMD", "INSTALL", ".", paste0("--library=", local_lib)))
if (install_status != 0) {
  stop("Failed to install package into temporary library (status ", install_status, ")")
}

.libPaths(c(local_lib, .libPaths()))
tools::buildVignettes(dir = ".", tangle = TRUE)

build_status <- system2("R", c("CMD", "build", ".", "--no-build-vignettes"))
if (build_status != 0) {
  stop("R CMD build failed (status ", build_status, ")")
}

tarball <- sprintf("%s_%s.tar.gz", pkg_name, pkg_version)
if (!file.exists(tarball)) {
  stop("Tarball not found at ", tarball)
}

file.rename(tarball, file.path(dest_dir, tarball))

# Clean up the temporary library
unlink(local_lib, recursive = TRUE, force = TRUE)
