{/* vim: set filetype=mustache: */}}

{{/*
Default labels for resources associated with Gitea
*/}}
{{- define "app.labels" }}
  labels:
    app: gitea
    app.kubernetes.io/component: gitea
    app.kubernetes.io/instance: gitea
    app.kubernetes.io/name: gitea
    app.kubernetes.io/part-of: gitea
    generator: helm
{{- end }}

{{/*
