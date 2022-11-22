Test Django
```
python manage.py test
```

2. Build Container
```
docker build -f Dockerfile \
    -t registry.digitalocean.com/django-k8s-registry/django-k8s-app:latest \
    -t registry.digitalocean.com/django-k8s-registry/django-k8s-app:v1 \
    .
```

3. Push this container to Digital ocean container registry
```
docker push registry.digitalocean.com/django-k8s-registry/django-k8s-app --all-tags
```

4. Update secrets
```
kubectl delete secret django-k8s-app-prod-env
kubectl create secret generic django-k8s-app-prod-env --from-env-file=app/.env.prod
```

5. Update Deployment
```
kubectl apply -f k8s/apps/django-k8s-app.yaml
```

6. Wait for Rollout to Finish
```
kubectl rollout status deployment/django-k8s-app-deployment
```

7. Migrate the database
```
export SINGLE_POD_NAME=$(kubectl get pod -l app=django-k8s-app-deployment -o jsonpath="{.items[0].metadata.name}")
```
OR

```
export SINGLE_POD_NAME=$(kubectl get pod -l app=django-k8s-app-deployment -o NAME | tail -n 1)
```

Then run `migrate.sh`

```
kubectl exec -it $SINGLE_POD_NAME -- bash /app/migrate.sh
```