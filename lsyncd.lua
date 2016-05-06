settings {
    logfile = "/tmp/lsyncd.log",
    statusFile = "/tmp/lsyncd.status",
}

sync {
    default.rsync,
    source = "/localhome/campbr9",
    target = "/home/campbr9",
    delete = true,
    exclude = {
        "vmware"
    }
}
