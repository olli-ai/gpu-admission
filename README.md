# GPU admission

This is a fork from https://github.com/tkestack/gpu-manager to be deployed with Jenkins-X. The dockerfile has been totally changed for a clearer deployment.

It is a [scheduler extender](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/scheduling/scheduler_extender.md) for GPU admission. It read the resource `tencent.com/vcuda-core` and `tencent.com/vcuda-memory` and chooses fitting pods.

It adds annotations to the pod during the scheduling request, which is not compatible with `kube-schduler 1.14.10`. A [dirtily patched version](https://github.com/olli-ai/kubernetes/tree/pod-patch) has been created to make it work.
