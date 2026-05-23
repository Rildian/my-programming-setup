return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-11",
                path = "/usr/lib/jvm/java-11-openjdk-amd64",
              },
              {
                name = "JavaSE-17",
                path = "/usr/lib/jvm/java-17-openjdk-amd64",
              },
              {
                name = "JavaSE-21",
                path = "/usr/lib/jvm/java-21-openjdk-amd64",
                default = true,
              },
            },
          },
        },
      },
    },
  },
}
