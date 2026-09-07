import net from "node:net";
import { spawn } from "node:child_process";

const START_PORT = Number(process.env.PORT || 4173);
const OPEN_BROWSER = process.argv.includes("--open");

function isPortFree(port) {
  return new Promise((resolve) => {
    const server = net.createServer();
    server.once("error", () => resolve(false));
    server.once("listening", () => server.close(() => resolve(true)));
    server.listen(port, "127.0.0.1");
  });
}

async function findPort(start) {
  for (let port = start; port < start + 20; port += 1) {
    if (await isPortFree(port)) return port;
  }
  throw new Error(`No free port found between ${start} and ${start + 19}`);
}

const port = await findPort(START_PORT);
const url = `http://localhost:${port}`;

console.log("");
console.log("========================================");
console.log("  Lee Kum Kee Careers wireframe preview");
console.log("========================================");
console.log(`  Open this URL: ${url}`);
console.log("  Press Ctrl+C to stop the server.");
console.log("========================================");
console.log("");

const args = ["serve", ".", "--listen", String(port)];
if (OPEN_BROWSER) args.push("--open", "/index.html");

const child = spawn("npx", args, {
  stdio: "inherit",
  shell: true,
});

child.on("exit", (code) => process.exit(code ?? 0));
