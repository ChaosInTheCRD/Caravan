export const cpuTempStyles = /* css */ `
.cpuTemp {
  position: relative;
  display: flex;
  align-items: center;
  background-color: var(--blue);
}
.simple-bar--background-color-as-foreground .cpuTemp {
  color: var(--minor);
  background-color: transparent;
}
.simple-bar--no-color-in-data .cpuTemp {
  background-color: var(--minor);
}
.cpuTemp__icon {
  width: 14px;
  height: 14px;
  fill: var(--red);
  margin: 0 1px 0 4px;
  transform: translateZ(0);
}
`
