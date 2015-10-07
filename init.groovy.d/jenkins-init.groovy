// my-jenkins-init.groovy
import hudson.model.*;
import jenkins.model.*;

def inst = Jenkins.instance

def uCenter = inst.updateCenter

// Set the proxy for retrieving plugins. (Comment out and modify it if you need.)
// inst.proxy = new hudson.ProxyConfiguration("192.168.10.10", 3128, "proxyUser", "proxyPassword", "localhost, 192.*")

// Ensure the Update Center is up-to-date.
uCenter.updateAllSites()

def checkIfPluginInstalled = { pluginid ->
  for(p in inst.pluginManager.plugins) {
    if(p.shortName == pluginid){
      return true
    }
  }
  return false
}

// Installs the following plugins if not installed.
[
  "backup",
  "build-timeout",
  "checkstyle",
  "cron_column",
  "dry",
  "docker-plugin",
  "emotional-jenkins-plugin",
  "git",
  "git-client",
  "hipchat",
  "jdepend",
  "simple-theme-plugin",
  "ssh",
  "ssh-slaves",
  "thread-dump-action-plugin",
  "timestamper",
  "url-auth-jenkins"
].findAll({! checkIfPluginInstalled(it)}).each {
  uCenter.getPlugin(it).deploy()
}

// Set the number of executors (in master-node) to 0.
inst.setNumExecutors(0)

inst.reload()
