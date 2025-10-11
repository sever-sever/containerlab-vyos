
.PHONY: clab-deploy clab-destroy

clab-deploy:
	@echo "🚀 Starting Containerlab test..."
	clab deploy -t containerlab/vyos.clab.yaml

clab-destroy:
	@echo "❌ Stoping Containerlab test..."
	clab destroy -t containerlab/vyos.clab.yaml
