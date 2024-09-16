## Setup

```bash
sdk install java 22.0.2-graal
sdk use java 22.0.2-graal
```

## Native Binary

```bash
./gradlew nativeRun
app/build/native/nativeCompile/app
```

## Shadowed Binary

```bash
./gradlew shadowJar
java -jar app/build/libs/app-all.jar
```

## Compress

UPX significantly shrinks the size of the resulting binary.

```bash
brew install upx
upx app/build/native/nativeCompile/app
```

## Cyclone DX

```bash
./gradlew cyclonedxBom --info
```
## Sigstore

```bash
brew install cosign
brew install sigstore
brew install rekor-cli
```

### Signing with pregenerated key

```bash
wget https://github.com/codepitbull/releasing-demo/releases/download/v1.0.0/app-all.jar
cosign generate-key-pair
cosign sign-blob --key cosign.key app-all.jar
cosign sign-blob --key cosign.key --bundle cosign.bundle app-all.jar
```
### Signing with OIDC

```bash
wget https://github.com/codepitbull/releasing-demo/releases/download/v1.0.0/app-all.jar
cosign sign-blob app-all.jar
cosign sign-blob app-all.jar --bundle cosign.bundle
```

```bash
➜  releasing-demo git:(main) ✗ cosign sign-blob app-all.jar --bundle cosign.bundle
Using payload from: app-all.jar
Generating ephemeral keys...
Retrieving signed certificate...

        The sigstore service, hosted by sigstore a Series of LF Projects, LLC, is provided pursuant to the Hosted Project Tools Terms of Use, available at https://lfprojects.org/policies/hosted-project-tools-terms-of-use/.
        Note that if your submission includes personal data associated with this signed artifact, it will be part of an immutable record.
        This may include the email address associated with the account with which you authenticate your contractual Agreement.
        This information will be used for signing this artifact and will be stored in public transparency logs and cannot be removed later, and is subject to the Immutable Record notice at https://lfprojects.org/policies/hosted-project-tools-immutable-records/.

By typing 'y', you attest that (1) you are not submitting the personal data of any other person; and (2) you understand and agree to the statement and the Agreement terms at the URLs listed above.
Are you sure you would like to continue? [y/N] y
Your browser will now be opened to:
https://oauth2.sigstore.dev/auth/auth?access_type=online&client_id=sigstore&code_challenge=-RZxtoZ0fZb-Jw3wMwjHUkBx8n3iUKqGkbssdXz7siY&code_challenge_method=S256&nonce=2m4ogbjqFeZwjvjD8u07Ep536fz&redirect_uri=http%3A%2F%2Flocalhost%3A53356%2Fauth%2Fcallback&response_type=code&scope=openid+email&state=2m4ogfEpPdLpDvjyX6qgHNQejKa
Successfully verified SCT...
using ephemeral certificate:
-----BEGIN CERTIFICATE-----
MIIC0zCCAlmgAwIBAgIUc8crTzOQG9AFu2CNsNHJzWRKuQ4wCgYIKoZIzj0EAwMw
NzEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MR4wHAYDVQQDExVzaWdzdG9yZS1pbnRl
cm1lZGlhdGUwHhcNMjQwOTE0MjAyMjQ1WhcNMjQwOTE0MjAzMjQ1WjAAMFkwEwYH
KoZIzj0CAQYIKoZIzj0DAQcDQgAE3s9FGzH1Tzbcz1PfaPDxHa63/7FvMuE4SqtK
C788GXCSRMJWDFkt67pnkn3sqiVA6ekuG5PicR43G9UnNf7EuKOCAXgwggF0MA4G
A1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUbwom
8InDLLJzMa6w73+zALunCF4wHwYDVR0jBBgwFoAU39Ppz1YkEZb5qNjpKFWixi4Y
ZD8wIwYDVR0RAQH/BBkwF4EVam9jaGVuQGNvZGVwaXRidWxsLmRlMCwGCisGAQQB
g78wAQEEHmh0dHBzOi8vZ2l0aHViLmNvbS9sb2dpbi9vYXV0aDAuBgorBgEEAYO/
MAEIBCAMHmh0dHBzOi8vZ2l0aHViLmNvbS9sb2dpbi9vYXV0aDCBiQYKKwYBBAHW
eQIEAgR7BHkAdwB1AN09MGrGxxEyYxkeHJlnNwKiSl643jyt/4eKcoAvKe6OAAAB
kfIzxqMAAAQDAEYwRAIgEgAmIyt5DyQcVZyBmusklV3frx1/ROgVPjrhjds8uhMC
ICpc4S+BIqKauoBfVFRxexQAESlVzbZeNnTqQlCM3F36MAoGCCqGSM49BAMDA2gA
MGUCMDiG3EIkWUZn8hhT0irQhYqHzcmu9o2ShwlzS7etyRxO82Yq7TMqeqHd5aWc
cxw3IQIxAPDTx98dUO3rQS5o0yJSZrWeuFJRNYDao/ukmmXDC+MOCCxVHSxxrH2K
GsPhshA+Tw==
-----END CERTIFICATE-----

tlog entry created with index: 130566793
using ephemeral certificate:
-----BEGIN CERTIFICATE-----
MIIC0zCCAlmgAwIBAgIUc8crTzOQG9AFu2CNsNHJzWRKuQ4wCgYIKoZIzj0EAwMw
NzEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MR4wHAYDVQQDExVzaWdzdG9yZS1pbnRl
cm1lZGlhdGUwHhcNMjQwOTE0MjAyMjQ1WhcNMjQwOTE0MjAzMjQ1WjAAMFkwEwYH
KoZIzj0CAQYIKoZIzj0DAQcDQgAE3s9FGzH1Tzbcz1PfaPDxHa63/7FvMuE4SqtK
C788GXCSRMJWDFkt67pnkn3sqiVA6ekuG5PicR43G9UnNf7EuKOCAXgwggF0MA4G
A1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUbwom
8InDLLJzMa6w73+zALunCF4wHwYDVR0jBBgwFoAU39Ppz1YkEZb5qNjpKFWixi4Y
ZD8wIwYDVR0RAQH/BBkwF4EVam9jaGVuQGNvZGVwaXRidWxsLmRlMCwGCisGAQQB
g78wAQEEHmh0dHBzOi8vZ2l0aHViLmNvbS9sb2dpbi9vYXV0aDAuBgorBgEEAYO/
MAEIBCAMHmh0dHBzOi8vZ2l0aHViLmNvbS9sb2dpbi9vYXV0aDCBiQYKKwYBBAHW
eQIEAgR7BHkAdwB1AN09MGrGxxEyYxkeHJlnNwKiSl643jyt/4eKcoAvKe6OAAAB
kfIzxqMAAAQDAEYwRAIgEgAmIyt5DyQcVZyBmusklV3frx1/ROgVPjrhjds8uhMC
ICpc4S+BIqKauoBfVFRxexQAESlVzbZeNnTqQlCM3F36MAoGCCqGSM49BAMDA2gA
MGUCMDiG3EIkWUZn8hhT0irQhYqHzcmu9o2ShwlzS7etyRxO82Yq7TMqeqHd5aWc
cxw3IQIxAPDTx98dUO3rQS5o0yJSZrWeuFJRNYDao/ukmmXDC+MOCCxVHSxxrH2K
GsPhshA+Tw==
-----END CERTIFICATE-----

Wrote bundle to file cosign.bundle
MEQCIA/eeEy3ZOGyI0qxth9IgBKPrtHLaBLjGpDOzpcNNF9UAiBa/t9PtkEV0kRo9aMQIolcWqKUYejPeWhFAnL3uahJxQ==
```

```bash
rekor-cli get --log-index 130566793
```

```bash
LogID: c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d
Index: 130566793
IntegratedTime: 2024-09-14T20:22:46Z
UUID: 108e9186e8c5677aa748ac8f2406f8c3fa48da1e84e2770f9d735f38257625000cf73ad40a5ce89f
Body: {
  "HashedRekordObj": {
    "data": {
      "hash": {
        "algorithm": "sha256",
        "value": "2a9c7d1f25dca240cad915ddd85e4f3c9f077df3a0e6b1448084b4c8da4e3869"
      }
    },
    "signature": {
      "content": "MEQCIA/eeEy3ZOGyI0qxth9IgBKPrtHLaBLjGpDOzpcNNF9UAiBa/t9PtkEV0kRo9aMQIolcWqKUYejPeWhFAnL3uahJxQ==",
      "publicKey": {
        "content": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMwekNDQWxtZ0F3SUJBZ0lVYzhjclR6T1FHOUFGdTJDTnNOSEp6V1JLdVE0d0NnWUlLb1pJemowRUF3TXcKTnpFVk1CTUdBMVVFQ2hNTWMybG5jM1J2Y21VdVpHVjJNUjR3SEFZRFZRUURFeFZ6YVdkemRHOXlaUzFwYm5SbApjbTFsWkdsaGRHVXdIaGNOTWpRd09URTBNakF5TWpRMVdoY05NalF3T1RFME1qQXpNalExV2pBQU1Ga3dFd1lICktvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUzczlGR3pIMVR6YmN6MVBmYVBEeEhhNjMvN0Z2TXVFNFNxdEsKQzc4OEdYQ1NSTUpXREZrdDY3cG5rbjNzcWlWQTZla3VHNVBpY1I0M0c5VW5OZjdFdUtPQ0FYZ3dnZ0YwTUE0RwpBMVVkRHdFQi93UUVBd0lIZ0RBVEJnTlZIU1VFRERBS0JnZ3JCZ0VGQlFjREF6QWRCZ05WSFE0RUZnUVVid29tCjhJbkRMTEp6TWE2dzczK3pBTHVuQ0Y0d0h3WURWUjBqQkJnd0ZvQVUzOVBwejFZa0VaYjVxTmpwS0ZXaXhpNFkKWkQ4d0l3WURWUjBSQVFIL0JCa3dGNEVWYW05amFHVnVRR052WkdWd2FYUmlkV3hzTG1SbE1Dd0dDaXNHQVFRQgpnNzh3QVFFRUhtaDBkSEJ6T2k4dloybDBhSFZpTG1OdmJTOXNiMmRwYmk5dllYVjBhREF1QmdvckJnRUVBWU8vCk1BRUlCQ0FNSG1oMGRIQnpPaTh2WjJsMGFIVmlMbU52YlM5c2IyZHBiaTl2WVhWMGFEQ0JpUVlLS3dZQkJBSFcKZVFJRUFnUjdCSGtBZHdCMUFOMDlNR3JHeHhFeVl4a2VISmxuTndLaVNsNjQzanl0LzRlS2NvQXZLZTZPQUFBQgprZkl6eHFNQUFBUURBRVl3UkFJZ0VnQW1JeXQ1RHlRY1ZaeUJtdXNrbFYzZnJ4MS9ST2dWUGpyaGpkczh1aE1DCklDcGM0UytCSXFLYXVvQmZWRlJ4ZXhRQUVTbFZ6YlplTm5UcVFsQ00zRjM2TUFvR0NDcUdTTTQ5QkFNREEyZ0EKTUdVQ01EaUczRUlrV1VabjhoaFQwaXJRaFlxSHpjbXU5bzJTaHdselM3ZXR5UnhPODJZcTdUTXFlcUhkNWFXYwpjeHczSVFJeEFQRFR4OThkVU8zclFTNW8weUpTWnJXZXVGSlJOWURhby91a21tWERDK01PQ0N4VkhTeHhySDJLCkdzUGhzaEErVHc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
      }
    }
  }
}
```

```bash
cosign verify-blob --bundle cosign.bundle --certificate-identity=jochen@codepitbull.de --certificate-oidc-issuer=https://github.com/login/oauth app-all.jar
```

```bash
gh release -R codepitbull/releasing-demo upload v1.0.0 cosign.bundle
```

## Local testing

```bash
export JRELEASER_GITHUB_TOKEN=123
jreleaser release --dry-run
```

```bash
docker buildx build --sbom=true -t codepitbull/hello:latest .
docker login
docker push codepitbull/hello:latest
cosign sign codepitbull/hello@sha256:611a4504f59f67a07892862155ac09ae98ab23499f89d97e7eddcd195515ffa0
cosign verify --certificate-identity=jochen@codepitbull.de --certificate-oidc-issuer=https://github.com/login/oauth codepitbull/hello:latest 
```