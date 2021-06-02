# Esbuild error case

To reproduce:

```bash
git clone git@github.com:dimino/snowpack-bug-repro.git

docker-compose build dev
docker-compose up dev
```

Navigate to `localhost:8080` with a browser.

Expected: "HELLO REACT" to be displayed in the browser.

Actual:
```
dev_1  | /usr/src/snowpack-bug-repro/node_modules/esbuild/bin/esbuild: 1: /usr/src/snowpack-bug-repro/node_modules/esbuild/bin/esbuild: Syntax error: word unexpected (expecting ")")
dev_1  | node:events:342
dev_1  |       throw er; // Unhandled 'error' event
dev_1  |       ^
dev_1  |
dev_1  | Error: write EPIPE
dev_1  |     at afterWriteDispatched (node:internal/stream_base_commons:160:15)
dev_1  |     at writeGeneric (node:internal/stream_base_commons:151:3)
dev_1  |     at Socket._writeGeneric (node:net:769:11)
dev_1  |     at Socket._write (node:net:781:8)
dev_1  |     at writeOrBuffer (node:internal/streams/writable:389:12)
dev_1  |     at _write (node:internal/streams/writable:330:10)
dev_1  |     at Socket.Writable.write (node:internal/streams/writable:334:10)
dev_1  |     at Object.writeToStdin (/usr/src/snowpack-bug-repro/node_modules/esbuild/lib/main.js:1413:19)
dev_1  |     at sendRequest (/usr/src/snowpack-bug-repro/node_modules/esbuild/lib/main.js:576:14)
dev_1  |     at start (/usr/src/snowpack-bug-repro/node_modules/esbuild/lib/main.js:1064:13)
dev_1  |     at Object.transform (/usr/src/snowpack-bug-repro/node_modules/esbuild/lib/main.js:1114:9)
dev_1  |     at /usr/src/snowpack-bug-repro/node_modules/esbuild/lib/main.js:1465:55
dev_1  |     at new Promise (<anonymous>)
dev_1  |     at Object.transform (/usr/src/snowpack-bug-repro/node_modules/esbuild/lib/main.js:1465:14)
dev_1  |     at Object.transform (/usr/src/snowpack-bug-repro/node_modules/esbuild/lib/main.js:1336:62)
dev_1  |     at Object.load (/usr/src/snowpack-bug-repro/node_modules/snowpack/lib/index.js:121720:59)
dev_1  | Emitted 'error' event on Socket instance at:
dev_1  |     at emitErrorNT (node:internal/streams/destroy:193:8)
dev_1  |     at emitErrorCloseNT (node:internal/streams/destroy:158:3)
dev_1  |     at processTicksAndRejections (node:internal/process/task_queues:83:21) {
dev_1  |   errno: -32,
dev_1  |   code: 'EPIPE',
dev_1  |   syscall: 'write'
dev_1  | }
```

Not sure why esbuild isn't working successfully in this case.  This same project works successfully if run directly (not through docker).

The Docker environment *will* work if `curl` is used.
