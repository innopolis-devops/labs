def write_visit(date):
    with open(visits_path, 'a') as visits_file:
        visits_file.write(f"{str(date)}\n")
@app.route('/')
def show_moscow_time():
    offset = datetime.timezone(datetime.timedelta(hours=3))
    moscow_time = datetime.datetime.now(offset)
    print(type(moscow_time))
    clear_date = moscow_time.strftime("%H:%M:%S")
    write_visit(clear_date)
    return render_template('moscow_time.html', moscow_time=moscow_time, time=clear_date)


@app.route('/visits')
def visits():
    visits= []
    with open(visits_path, 'r') as visitsFile:
        lines = visitsFile.readlines()
        for line in lines:
            visits.append(line[:-2])
    return visits

if __name__ == '__main__':
    app.run()
    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )
