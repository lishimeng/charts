# Passport Helm charts

This chart installs [Passport](https://github.com/lishimeng/passport).


```bash
$ helm repo add alex.li https://lishimeng.github.io/charts/
$ helm install my-release my_repo/passport
```

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release my_repo/passport
```

The command deploys Passport on the Kubernetes cluster in the default configuration. The Parameters 
section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.
