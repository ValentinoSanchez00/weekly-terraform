output "vm_public_ips" {
  description = "IPs públicas de las máquinas virtuales"
  value       = module.virtualMachine.my_nsg_id
}