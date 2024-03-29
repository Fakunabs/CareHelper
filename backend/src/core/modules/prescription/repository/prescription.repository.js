import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
    createPrescription(prescription, trx) {
        if (trx) return this.query().insert(prescription).transacting(trx);
        return this.query().insert(prescription);
    }

    findById(id) {
        return this.query().where('prescriptions.id', '=', id).select(
            'prescriptions.id',
            { examinationId: 'prescriptions.examination_id' },
            'prescriptions.details',
            'prescriptions.note',
            { startDate: 'prescriptions.start_date' },
            { endDate: 'prescriptions.end_date' },
            {
                prescriptionFilename: 'prescriptions.prescription_filename',
            },
        );
    }

    findByExaminationId(examinationId) {
        return this.query()
            .where('prescriptions.examination_id', '=', examinationId)
            .select(
                'prescriptions.id',
                { examinationId: 'prescriptions.examination_id' },
                'prescriptions.details',
                'prescriptions.note',
                { startDate: 'prescriptions.start_date' },
                { endDate: 'prescriptions.end_date' },
                {
                    prescriptionFilename: 'prescriptions.prescription_filename',
                },
            )
            .orderBy('prescriptions.start_date', 'desc');
    }
}

export const PrescriptonRepository = new Repository('prescriptions');
