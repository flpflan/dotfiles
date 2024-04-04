吹毛求疵的检查：`cargo clippy -- -W clippy::pedantic` ( 具体还是要看clippy文档 )

体积最小化:
```toml
[profile.release]
lto = true
panic = "abort"
strip = true
codegen-units = 1
```