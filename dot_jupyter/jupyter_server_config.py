# Configuration file for jupyter-server.

#------------------------------------------------------------------------------
# Application(SingletonConfigurable) configuration
#------------------------------------------------------------------------------
## This is an application.

#------------------------------------------------------------------------------
# JupyterApp(Application) configuration
#------------------------------------------------------------------------------
## Base class for Jupyter applications

#------------------------------------------------------------------------------
# ServerApp(JupyterApp) configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# ConnectionFileMixin(LoggingConfigurable) configuration
#------------------------------------------------------------------------------
## Mixin for configurable classes that work with connection files

#------------------------------------------------------------------------------
# KernelManager(ConnectionFileMixin) configuration
#------------------------------------------------------------------------------
## Manages a single kernel in a subprocess on this host.
#  
#  This version starts kernels with Popen.

#------------------------------------------------------------------------------
# Session(Configurable) configuration
#------------------------------------------------------------------------------
## Object for handling serialization and sending of messages.

#------------------------------------------------------------------------------
# MultiKernelManager(LoggingConfigurable) configuration
#------------------------------------------------------------------------------
## A class for managing multiple kernels.

#------------------------------------------------------------------------------
# MappingKernelManager(MultiKernelManager) configuration
#------------------------------------------------------------------------------
## A KernelManager that handles - File mapping - HTTP error handling - Kernel
#  message filtering

#------------------------------------------------------------------------------
# KernelSpecManager(LoggingConfigurable) configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# AsyncMultiKernelManager(MultiKernelManager) configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# AsyncMappingKernelManager(MappingKernelManager, AsyncMultiKernelManager) configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# ContentsManager(LoggingConfigurable) configuration
#------------------------------------------------------------------------------
## Base class for serving files and directories.

#------------------------------------------------------------------------------
# FileManagerMixin(Configurable) configuration
#------------------------------------------------------------------------------
## Mixin for ContentsAPI classes that interact with the filesystem.

#------------------------------------------------------------------------------
# FileContentsManager(FileManagerMixin, ContentsManager) configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# AsyncContentsManager(ContentsManager) configuration
#------------------------------------------------------------------------------
## Base class for serving files and directories asynchronously.

#------------------------------------------------------------------------------
# AsyncFileManagerMixin(FileManagerMixin) configuration
#------------------------------------------------------------------------------
## Mixin for ContentsAPI classes that interact with the filesystem
#  asynchronously.

#------------------------------------------------------------------------------
# AsyncFileContentsManager(FileContentsManager, AsyncFileManagerMixin, AsyncContentsManager) configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# NotebookNotary(LoggingConfigurable) configuration
#------------------------------------------------------------------------------
## A class for computing and verifying notebook signatures.

#------------------------------------------------------------------------------
# GatewayKernelManager(MappingKernelManager) configuration
#------------------------------------------------------------------------------
## Kernel manager that supports remote kernels hosted by Jupyter Kernel or
#  Enterprise Gateway.

#------------------------------------------------------------------------------
# GatewayKernelSpecManager(KernelSpecManager) configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# GatewayClient(SingletonConfigurable) configuration
#------------------------------------------------------------------------------
## This class manages the configuration.  It's its own singleton class so that we
#  can share these values across all objects.  It also contains some helper methods
#   to build request arguments out of the various config options.

#------------------------------------------------------------------------------
# JupyterLab System Monitor
#------------------------------------------------------------------------------
## For RasPi4B for now

## memory
c.ServerApp.ResourceUseDisplay.mem_limit = 4294967296

## cpu
c.ServerApp.ResourceUseDisplay.track_cpu_percent = True
c.ServerApp.ResourceUseDisplay.cpu_limit = 4
