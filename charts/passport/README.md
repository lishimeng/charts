# Tree Helm charts

This chart installs [Tree](https://github.com/lishimeng/tree), an open source message provider.


```bash
$ helm repo add alex.li https://lishimeng.github.io/charts/
$ helm install my-release alex.li/tree
```

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release alex.li/tree
```

The command deploys Tree on the Kubernetes cluster in the default configuration. The Parameters 
section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.
