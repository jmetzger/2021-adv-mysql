# Replicaset troubleshooting

## Node crashes and data was changed 

```
# node cannot join automatically 
# you need to set the recoveryMethod 
rs=dba.getReplicatSet()
rs.status()
rs.rejoinInstance('repl@slave',{recoveryMethod: 'clone'})

```
