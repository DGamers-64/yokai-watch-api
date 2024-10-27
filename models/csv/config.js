import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import csv from 'csv-parser';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const CSV_BASE_PATH = path.join(__dirname, '../../databases/csv');

function normalizeString(str) {
    if (typeof str !== 'string') {
        return '';
    }
    
    return str
        .normalize('NFD')
        .replace(/[\u0300-\u036f]/g, '')
        .toLowerCase();
}

function parseRow(row) {
    const parsedRow = {};
    for (const key in row) {
        const value = row[key];
        parsedRow[key] = isNaN(value) ? value : Number(value);
    }
    return parsedRow;
}

export class CsvHandler {
    static async findInCsv(fileName, conditions) {
        const filePath = path.join(CSV_BASE_PATH, fileName);

        return new Promise((resolve, reject) => {
            const results = [];

            fs.createReadStream(filePath)
                .pipe(csv())
                .on('data', (row) => {
                    let matchesAllConditions = true;

                    for (const key in conditions) {
                        const conditionValue = conditions[key];
                        const rowValue = row[key];

                        const normalizedRowValue = normalizeString(rowValue);
                        const normalizedConditionValue = normalizeString(conditionValue);

                        const rowValueAsNumber = Number(rowValue);
                        const conditionValueAsNumber = Number(conditionValue);

                        if (key === 'nombre') {
                            if (normalizedRowValue !== normalizedConditionValue) {
                                matchesAllConditions = false;
                                break;
                            }
                        } else {
                            if (!(rowValue === conditionValue || rowValueAsNumber === conditionValueAsNumber)) {
                                matchesAllConditions = false;
                                break;
                            }
                        }
                    }

                    if (matchesAllConditions) {
                        results.push(parseRow(row));
                    }
                })
                .on('end', () => {
                    resolve(results);
                })
                .on('error', (error) => {
                    console.error('Error reading CSV file:', error);
                    reject(error);
                });
        });
    }
}
