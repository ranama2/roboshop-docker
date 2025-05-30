default:
	git pull
	ansible-playbook -i $(component_name).maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=$(component_name) -e env=$(env)

all:
	git pull
	terraform init
	terraform apply -auto-approve
	ansible-playbook -i frontend.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=frontend-docker -e env=$(env)
	ansible-playbook -i redis.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=redis -e env=$(env)
	ansible-playbook -i mongodb.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=mongodb -e env=$(env)
	ansible-playbook -i mysql.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=mysql -e env=$(env)
	ansible-playbook -i rabbitmq.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=rabbitmq -e env=$(env)
	ansible-playbook -i catalogue.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=catalogue-docker -e env=$(env)
	ansible-playbook -i user.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=user-docker -e env=$(env)
	ansible-playbook -i cart.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=cart-docker -e env=$(env)
	ansible-playbook -i shipping.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=shipping-docker -e env=$(env)
	ansible-playbook -i payment.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component_name=payment-docker -e env=$(env)

destroy:
	terraform destroy -auto-approve